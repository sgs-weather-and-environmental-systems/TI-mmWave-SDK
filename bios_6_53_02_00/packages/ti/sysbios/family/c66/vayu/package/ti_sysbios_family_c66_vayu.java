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

public class ti_sysbios_family_c66_vayu
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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.c66.vayu.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.c66.vayu", new Value.Obj("ti.sysbios.family.c66.vayu", pkgP));
    }

    void Power$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c66.vayu.Power.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c66.vayu.Power", new Value.Obj("ti.sysbios.family.c66.vayu.Power", po));
        pkgV.bind("Power", vo);
        // decls 
        om.bind("ti.sysbios.family.c66.vayu.Power.Suspend", new Proto.Enm("ti.sysbios.family.c66.vayu.Power.Suspend"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.vayu.Power$$CpuSysRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.vayu.Power.CpuSysRegs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.vayu.Power$$IntcConfig", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.vayu.Power.IntcConfig", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.vayu.Power$$SystemConfig", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.vayu.Power.SystemConfig", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.vayu.Power$$EdmaConfig", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.vayu.Power.EdmaConfig", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.vayu.Power$$CpuRam", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.vayu.Power.CpuRam", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.vayu.Power$$SubsystemContext", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.vayu.Power.SubsystemContext", new Proto.Str(spo, false));
    }

    void Power$$CONSTS()
    {
        // module Power
        om.bind("ti.sysbios.family.c66.vayu.Power.Suspend_HIBERNATE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.vayu.Power.Suspend", "ti.sysbios.family.c66.vayu"), "ti.sysbios.family.c66.vayu.Power.Suspend_HIBERNATE", 0));
        om.bind("ti.sysbios.family.c66.vayu.Power.suspend", new Extern("ti_sysbios_family_c66_vayu_Power_suspend__E", "xdc_UInt(*)(ti_sysbios_family_c66_vayu_Power_Suspend)", true, false));
        om.bind("ti.sysbios.family.c66.vayu.Power.resetFxn", new Extern("ti_sysbios_family_c66_vayu_Power_resetFxn__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c66.vayu.Power.standby", new Extern("ti_sysbios_family_c66_vayu_Power_standby__I", "xdc_UInt(*)(xdc_UInt32*)", true, false));
        om.bind("ti.sysbios.family.c66.vayu.Power.standbyTest", new Extern("ti_sysbios_family_c66_vayu_Power_standbyTest__I", "xdc_UInt(*)(xdc_UInt32*)", true, false));
    }

    void Power$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Power$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Power$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.vayu.Power.CpuSysRegs", "ti.sysbios.family.c66.vayu");
        sizes.clear();
        sizes.add(Global.newArray("AMR", "UInt32"));
        sizes.add(Global.newArray("CSR", "UInt32"));
        sizes.add(Global.newArray("IER", "UInt32"));
        sizes.add(Global.newArray("ISTP", "UInt32"));
        sizes.add(Global.newArray("IRP", "UInt32"));
        sizes.add(Global.newArray("ILC", "UInt32"));
        sizes.add(Global.newArray("RILC", "UInt32"));
        sizes.add(Global.newArray("REP", "UInt32"));
        sizes.add(Global.newArray("FADCR", "UInt32"));
        sizes.add(Global.newArray("FAUCR", "UInt32"));
        sizes.add(Global.newArray("FMCR", "UInt32"));
        sizes.add(Global.newArray("SSR", "UInt32"));
        sizes.add(Global.newArray("GPLYA", "UInt32"));
        sizes.add(Global.newArray("GPLYB", "UInt32"));
        sizes.add(Global.newArray("GFPGFR", "UInt32"));
        sizes.add(Global.newArray("TSR", "UInt32"));
        sizes.add(Global.newArray("ITSR", "UInt32"));
        sizes.add(Global.newArray("IERR", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.vayu.Power.CpuSysRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.vayu.Power.CpuSysRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.vayu.Power.CpuSysRegs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.vayu.Power.IntcConfig", "ti.sysbios.family.c66.vayu");
        sizes.clear();
        sizes.add(Global.newArray("EVTMASK0", "UInt32"));
        sizes.add(Global.newArray("EVTMASK1", "UInt32"));
        sizes.add(Global.newArray("EVTMASK2", "UInt32"));
        sizes.add(Global.newArray("EVTMASK3", "UInt32"));
        sizes.add(Global.newArray("EXPMASK0", "UInt32"));
        sizes.add(Global.newArray("EXPMASK1", "UInt32"));
        sizes.add(Global.newArray("EXPMASK2", "UInt32"));
        sizes.add(Global.newArray("EXPMASK3", "UInt32"));
        sizes.add(Global.newArray("INTMUX1", "UInt32"));
        sizes.add(Global.newArray("INTMUX2", "UInt32"));
        sizes.add(Global.newArray("INTMUX3", "UInt32"));
        sizes.add(Global.newArray("AEGMUX0", "UInt32"));
        sizes.add(Global.newArray("AEGMUX1", "UInt32"));
        sizes.add(Global.newArray("INTDMASK", "UInt32"));
        sizes.add(Global.newArray("PDCCMD", "UInt32"));
        sizes.add(Global.newArray("PAMAP", "A16;UInt32"));
        sizes.add(Global.newArray("L2CFG", "UInt32"));
        sizes.add(Global.newArray("L1PCFG", "UInt32"));
        sizes.add(Global.newArray("L1PCC", "UInt32"));
        sizes.add(Global.newArray("L1DCFG", "UInt32"));
        sizes.add(Global.newArray("L1DCC", "UInt32"));
        sizes.add(Global.newArray("MAR", "A244;UInt32"));
        sizes.add(Global.newArray("L2MPPA", "A32;UInt32"));
        sizes.add(Global.newArray("L1PMPPA", "A16;UInt32"));
        sizes.add(Global.newArray("L1DMPPA", "A16;UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.vayu.Power.IntcConfig']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.vayu.Power.IntcConfig']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.vayu.Power.IntcConfig'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.vayu.Power.SystemConfig", "ti.sysbios.family.c66.vayu");
        sizes.clear();
        sizes.add(Global.newArray("DSP_SYS_SYSCONFIG", "UInt32"));
        sizes.add(Global.newArray("BUSCONFIG", "UInt32"));
        sizes.add(Global.newArray("IRQWAKEEN0", "UInt32"));
        sizes.add(Global.newArray("IRQWAKEEN1", "UInt32"));
        sizes.add(Global.newArray("DMAWAKEEN0", "UInt32"));
        sizes.add(Global.newArray("DMAWAKEEN1", "UInt32"));
        sizes.add(Global.newArray("EVTOUTSET", "UInt32"));
        sizes.add(Global.newArray("ERRINTIRQENABLESET", "UInt32"));
        sizes.add(Global.newArray("EDMAWAKE0IRQENABLESET", "UInt32"));
        sizes.add(Global.newArray("EDMAWAKE1IRQENABLESET", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.vayu.Power.SystemConfig']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.vayu.Power.SystemConfig']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.vayu.Power.SystemConfig'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.vayu.Power.EdmaConfig", "ti.sysbios.family.c66.vayu");
        sizes.clear();
        sizes.add(Global.newArray("CLKGDIS", "UInt32"));
        sizes.add(Global.newArray("DCHMAP", "A64;UInt32"));
        sizes.add(Global.newArray("QCHMAP", "A8;UInt32"));
        sizes.add(Global.newArray("DMAQNUM", "A8;UInt32"));
        sizes.add(Global.newArray("QDMAQNUM", "UInt32"));
        sizes.add(Global.newArray("QUETCMAP", "UInt32"));
        sizes.add(Global.newArray("QUEPRI", "UInt32"));
        sizes.add(Global.newArray("regionAccessBits", "A24;UInt32"));
        sizes.add(Global.newArray("QWMTHRA", "UInt32"));
        sizes.add(Global.newArray("AETCTL", "UInt32"));
        sizes.add(Global.newArray("IER", "UInt32"));
        sizes.add(Global.newArray("IERH", "UInt32"));
        sizes.add(Global.newArray("QEER", "UInt32"));
        sizes.add(Global.newArray("PaRAMs", "A1024;UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.vayu.Power.EdmaConfig']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.vayu.Power.EdmaConfig']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.vayu.Power.EdmaConfig'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.vayu.Power.CpuRam", "ti.sysbios.family.c66.vayu");
        sizes.clear();
        sizes.add(Global.newArray("L1PSram", "A8192;UInt32"));
        sizes.add(Global.newArray("L1DSram", "A8192;UInt32"));
        sizes.add(Global.newArray("L2Sram", "A73728;UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.vayu.Power.CpuRam']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.vayu.Power.CpuRam']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.vayu.Power.CpuRam'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.vayu.Power.SubsystemContext", "ti.sysbios.family.c66.vayu");
        sizes.clear();
        sizes.add(Global.newArray("cpuSysRegs", "Sti.sysbios.family.c66.vayu.Power;CpuSysRegs"));
        sizes.add(Global.newArray("configINTC", "Sti.sysbios.family.c66.vayu.Power;IntcConfig"));
        sizes.add(Global.newArray("configSystem", "Sti.sysbios.family.c66.vayu.Power;SystemConfig"));
        sizes.add(Global.newArray("configEDMA", "Sti.sysbios.family.c66.vayu.Power;EdmaConfig"));
        sizes.add(Global.newArray("cpuRam", "Sti.sysbios.family.c66.vayu.Power;CpuRam"));
        sizes.add(Global.newArray("taskKey", "UInt32"));
        sizes.add(Global.newArray("swiKey", "UInt32"));
        sizes.add(Global.newArray("hwiKey", "UInt32"));
        sizes.add(Global.newArray("sizeOfL1PSram", "UInt32"));
        sizes.add(Global.newArray("sizeOfL1DSram", "UInt32"));
        sizes.add(Global.newArray("sizeOfL2Sram", "UInt32"));
        sizes.add(Global.newArray("tscRunning", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.vayu.Power.SubsystemContext']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.vayu.Power.SubsystemContext']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.vayu.Power.SubsystemContext'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Power$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c66/vayu/Power.xs");
        om.bind("ti.sysbios.family.c66.vayu.Power$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power.Module", "ti.sysbios.family.c66.vayu");
        po.init("ti.sysbios.family.c66.vayu.Power.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.c66.vayu"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("tpccRegs", new Proto.Adr("xdc_Ptr", "Pv"), 0x03300000L, "w");
            po.addFld("systemRegs", new Proto.Adr("xdc_Ptr", "Pv"), 0x01D00000L, "w");
            po.addFld("loadSegment", $$T_Str, "EXT_RAM", "wh");
            po.addFld("useStandbyTestFxn", $$T_Bool, false, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c66.vayu.Power$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c66.vayu.Power$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c66.vayu.Power$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c66.vayu.Power$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Power.CpuSysRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$CpuSysRegs", "ti.sysbios.family.c66.vayu");
        po.init("ti.sysbios.family.c66.vayu.Power.CpuSysRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("AMR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISTP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IRP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ILC", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RILC", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("REP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FADCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FAUCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FMCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GPLYA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GPLYB", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GFPGFR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ITSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IERR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.IntcConfig
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$IntcConfig", "ti.sysbios.family.c66.vayu");
        po.init("ti.sysbios.family.c66.vayu.Power.IntcConfig", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("EVTMASK0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EVTMASK1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EVTMASK2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EVTMASK3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EXPMASK0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EXPMASK1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EXPMASK2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EXPMASK3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTMUX1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTMUX2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTMUX3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("AEGMUX0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("AEGMUX1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTDMASK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PDCCMD", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PAMAP", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
                po.addFld("L2CFG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1PCFG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1PCC", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1DCFG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1DCC", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MAR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(244L)), $$DEFAULT, "w");
                po.addFld("L2MPPA", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("L1PMPPA", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
                po.addFld("L1DMPPA", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
        // struct Power.SystemConfig
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$SystemConfig", "ti.sysbios.family.c66.vayu");
        po.init("ti.sysbios.family.c66.vayu.Power.SystemConfig", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("DSP_SYS_SYSCONFIG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BUSCONFIG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IRQWAKEEN0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IRQWAKEEN1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("DMAWAKEEN0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("DMAWAKEEN1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EVTOUTSET", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ERRINTIRQENABLESET", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EDMAWAKE0IRQENABLESET", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EDMAWAKE1IRQENABLESET", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.EdmaConfig
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$EdmaConfig", "ti.sysbios.family.c66.vayu");
        po.init("ti.sysbios.family.c66.vayu.Power.EdmaConfig", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CLKGDIS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("DCHMAP", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("QCHMAP", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("DMAQNUM", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("QDMAQNUM", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("QUETCMAP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("QUEPRI", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("regionAccessBits", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(24L)), $$DEFAULT, "w");
                po.addFld("QWMTHRA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("AETCTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IERH", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("QEER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PaRAMs", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(1024L)), $$DEFAULT, "w");
        // struct Power.CpuRam
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$CpuRam", "ti.sysbios.family.c66.vayu");
        po.init("ti.sysbios.family.c66.vayu.Power.CpuRam", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("L1PSram", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8192L)), $$DEFAULT, "w");
                po.addFld("L1DSram", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8192L)), $$DEFAULT, "w");
                po.addFld("L2Sram", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(73728L)), $$DEFAULT, "w");
        // struct Power.SubsystemContext
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$SubsystemContext", "ti.sysbios.family.c66.vayu");
        po.init("ti.sysbios.family.c66.vayu.Power.SubsystemContext", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("cpuSysRegs", (Proto)om.findStrict("ti.sysbios.family.c66.vayu.Power.CpuSysRegs", "ti.sysbios.family.c66.vayu"), $$DEFAULT, "w");
                po.addFld("configINTC", (Proto)om.findStrict("ti.sysbios.family.c66.vayu.Power.IntcConfig", "ti.sysbios.family.c66.vayu"), $$DEFAULT, "w");
                po.addFld("configSystem", (Proto)om.findStrict("ti.sysbios.family.c66.vayu.Power.SystemConfig", "ti.sysbios.family.c66.vayu"), $$DEFAULT, "w");
                po.addFld("configEDMA", (Proto)om.findStrict("ti.sysbios.family.c66.vayu.Power.EdmaConfig", "ti.sysbios.family.c66.vayu"), $$DEFAULT, "w");
                po.addFld("cpuRam", (Proto)om.findStrict("ti.sysbios.family.c66.vayu.Power.CpuRam", "ti.sysbios.family.c66.vayu"), $$DEFAULT, "w");
                po.addFld("taskKey", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("swiKey", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hwiKey", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("sizeOfL1PSram", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("sizeOfL1DSram", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("sizeOfL2Sram", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("tscRunning", $$T_Bool, $$UNDEF, "w");
    }

    void Power$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power", "ti.sysbios.family.c66.vayu");
        vo.bind("CpuSysRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.vayu.Power.CpuSysRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$CpuSysRegs", "ti.sysbios.family.c66.vayu");
        vo.bind("IntcConfig$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.vayu.Power.IntcConfig", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$IntcConfig", "ti.sysbios.family.c66.vayu");
        vo.bind("SystemConfig$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.vayu.Power.SystemConfig", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$SystemConfig", "ti.sysbios.family.c66.vayu");
        vo.bind("EdmaConfig$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.vayu.Power.EdmaConfig", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$EdmaConfig", "ti.sysbios.family.c66.vayu");
        vo.bind("CpuRam$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.vayu.Power.CpuRam", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$CpuRam", "ti.sysbios.family.c66.vayu");
        vo.bind("SubsystemContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.vayu.Power.SubsystemContext", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power$$SubsystemContext", "ti.sysbios.family.c66.vayu");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.c66.vayu.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.c66.vayu"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c66/vayu/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.c66.vayu"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.c66.vayu"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.c66.vayu"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.c66.vayu"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.c66.vayu"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.c66.vayu"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.c66.vayu", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.c66.vayu");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.c66.vayu.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.c66.vayu'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.c66.vayu$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.c66.vayu$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.c66.vayu$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c66.vayu.ae66',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c66.vayu.ae66e',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c66.vayu.ae66', {target: 'ti.targets.elf.C66', suffix: 'e66'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c66.vayu.ae66e', {target: 'ti.targets.elf.C66_big_endian', suffix: 'e66e'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Power$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power", "ti.sysbios.family.c66.vayu");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.vayu.Power.Module", "ti.sysbios.family.c66.vayu");
        vo.init2(po, "ti.sysbios.family.c66.vayu.Power", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c66.vayu.Power$$capsule", "ti.sysbios.family.c66.vayu"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c66.vayu", "ti.sysbios.family.c66.vayu"));
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
        vo.bind("Suspend", om.findStrict("ti.sysbios.family.c66.vayu.Power.Suspend", "ti.sysbios.family.c66.vayu"));
        mcfgs.add("tpccRegs");
        mcfgs.add("systemRegs");
        mcfgs.add("useStandbyTestFxn");
        icfgs.add("useStandbyTestFxn");
        vo.bind("CpuSysRegs", om.findStrict("ti.sysbios.family.c66.vayu.Power.CpuSysRegs", "ti.sysbios.family.c66.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.vayu.Power.CpuSysRegs", "ti.sysbios.family.c66.vayu"));
        vo.bind("IntcConfig", om.findStrict("ti.sysbios.family.c66.vayu.Power.IntcConfig", "ti.sysbios.family.c66.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.vayu.Power.IntcConfig", "ti.sysbios.family.c66.vayu"));
        vo.bind("SystemConfig", om.findStrict("ti.sysbios.family.c66.vayu.Power.SystemConfig", "ti.sysbios.family.c66.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.vayu.Power.SystemConfig", "ti.sysbios.family.c66.vayu"));
        vo.bind("EdmaConfig", om.findStrict("ti.sysbios.family.c66.vayu.Power.EdmaConfig", "ti.sysbios.family.c66.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.vayu.Power.EdmaConfig", "ti.sysbios.family.c66.vayu"));
        vo.bind("CpuRam", om.findStrict("ti.sysbios.family.c66.vayu.Power.CpuRam", "ti.sysbios.family.c66.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.vayu.Power.CpuRam", "ti.sysbios.family.c66.vayu"));
        vo.bind("SubsystemContext", om.findStrict("ti.sysbios.family.c66.vayu.Power.SubsystemContext", "ti.sysbios.family.c66.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.vayu.Power.SubsystemContext", "ti.sysbios.family.c66.vayu"));
        vo.bind("Suspend_HIBERNATE", om.findStrict("ti.sysbios.family.c66.vayu.Power.Suspend_HIBERNATE", "ti.sysbios.family.c66.vayu"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c66.vayu")).add(vo);
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
        vo.bind("suspend", om.findStrict("ti.sysbios.family.c66.vayu.Power.suspend", "ti.sysbios.family.c66.vayu"));
        vo.bind("resetFxn", om.findStrict("ti.sysbios.family.c66.vayu.Power.resetFxn", "ti.sysbios.family.c66.vayu"));
        vo.bind("standby", om.findStrict("ti.sysbios.family.c66.vayu.Power.standby", "ti.sysbios.family.c66.vayu"));
        vo.bind("standbyTest", om.findStrict("ti.sysbios.family.c66.vayu.Power.standbyTest", "ti.sysbios.family.c66.vayu"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c66_vayu_Power_Module__startupDone__E", "ti_sysbios_family_c66_vayu_Power_suspend__E"));
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
        pkgV.bind("Power", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Power");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c66.vayu.Power", "ti.sysbios.family.c66.vayu"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.c66.vayu.Power")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.c66.vayu")).add(pkgV);
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
        Power$$OBJECTS();
        Power$$CONSTS();
        Power$$CREATES();
        Power$$FUNCTIONS();
        Power$$SIZES();
        Power$$TYPES();
        if (isROV) {
            Power$$ROV();
        }//isROV
        $$SINGLETONS();
        Power$$SINGLETONS();
        $$INITIALIZATION();
    }
}
