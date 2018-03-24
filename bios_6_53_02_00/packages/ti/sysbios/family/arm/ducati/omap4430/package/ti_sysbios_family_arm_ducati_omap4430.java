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

public class ti_sysbios_family_arm_ducati_omap4430
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.family.arm.ducati");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430", new Value.Obj("ti.sysbios.family.arm.ducati.omap4430", pkgP));
    }

    void Power$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power", new Value.Obj("ti.sysbios.family.arm.ducati.omap4430.Power", po));
        pkgV.bind("Power", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$SuspendArgs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$Struct8", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.Struct8", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$Struct10", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$TablePIDS", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$IPRxRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$CfgRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$NVICContext", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$ContextAMMU", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$ContextCTM", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$CpuRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$PrivateContext", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$UnicacheConfig", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$SubsystemContext", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$DucatiContext", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$SdmaRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs", new Proto.Str(spo, false));
    }

    void Power$$CONSTS()
    {
        // module Power
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.L2RAM", 0x55020000L);
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.idleCPU", new Extern("ti_sysbios_family_arm_ducati_omap4430_Power_idleCPU__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.suspend", new Extern("ti_sysbios_family_arm_ducati_omap4430_Power_suspend__E", "xdc_UInt(*)(ti_sysbios_family_arm_ducati_omap4430_Power_SuspendArgs*)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.resetFxn", new Extern("ti_sysbios_family_arm_ducati_omap4430_Power_resetFxn__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.saveCpuRegs", new Extern("ti_sysbios_family_arm_ducati_omap4430_Power_saveCpuRegs__I", "xdc_UInt32(*)(xdc_Ptr,xdc_Ptr)", true, false));
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

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("pmMasterCore", "UShort"));
        sizes.add(Global.newArray("rendezvousResume", "UShort"));
        sizes.add(Global.newArray("dmaChannel", "TInt"));
        sizes.add(Global.newArray("intMask31_0", "UInt"));
        sizes.add(Global.newArray("intMask63_32", "UInt"));
        sizes.add(Global.newArray("intMask79_64", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct8", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("a0", "UInt32"));
        sizes.add(Global.newArray("a1", "UInt32"));
        sizes.add(Global.newArray("a2", "UInt32"));
        sizes.add(Global.newArray("a3", "UInt32"));
        sizes.add(Global.newArray("a4", "UInt32"));
        sizes.add(Global.newArray("a5", "UInt32"));
        sizes.add(Global.newArray("a6", "UInt32"));
        sizes.add(Global.newArray("a7", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.Struct8']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.Struct8']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.Struct8'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("a0", "UInt32"));
        sizes.add(Global.newArray("a1", "UInt32"));
        sizes.add(Global.newArray("a2", "UInt32"));
        sizes.add(Global.newArray("a3", "UInt32"));
        sizes.add(Global.newArray("a4", "UInt32"));
        sizes.add(Global.newArray("a5", "UInt32"));
        sizes.add(Global.newArray("a6", "UInt32"));
        sizes.add(Global.newArray("a7", "UInt32"));
        sizes.add(Global.newArray("a8", "UInt32"));
        sizes.add(Global.newArray("a9", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.Struct10']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.Struct10']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.Struct10'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("PID1", "UInt32"));
        sizes.add(Global.newArray("PID2", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("IPR0", "UInt32"));
        sizes.add(Global.newArray("IPR1", "UInt32"));
        sizes.add(Global.newArray("IPR2", "UInt32"));
        sizes.add(Global.newArray("IPR3", "UInt32"));
        sizes.add(Global.newArray("IPR4", "UInt32"));
        sizes.add(Global.newArray("IPR5", "UInt32"));
        sizes.add(Global.newArray("IPR6", "UInt32"));
        sizes.add(Global.newArray("IPR7", "UInt32"));
        sizes.add(Global.newArray("IPR8", "UInt32"));
        sizes.add(Global.newArray("IPR9", "UInt32"));
        sizes.add(Global.newArray("IPR10", "UInt32"));
        sizes.add(Global.newArray("IPR11", "UInt32"));
        sizes.add(Global.newArray("IPR12", "UInt32"));
        sizes.add(Global.newArray("IPR13", "UInt32"));
        sizes.add(Global.newArray("IPR14", "UInt32"));
        sizes.add(Global.newArray("IPR15", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("VTOR", "UInt32"));
        sizes.add(Global.newArray("AIRCR", "UInt32"));
        sizes.add(Global.newArray("SCR", "UInt32"));
        sizes.add(Global.newArray("CCR", "UInt32"));
        sizes.add(Global.newArray("SHPR0", "UInt32"));
        sizes.add(Global.newArray("SHPR4", "UInt32"));
        sizes.add(Global.newArray("SHPR8", "UInt32"));
        sizes.add(Global.newArray("SHCSR", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("AUXCTRL", "UInt32"));
        sizes.add(Global.newArray("STCSR", "UInt32"));
        sizes.add(Global.newArray("STRVR", "UInt32"));
        sizes.add(Global.newArray("ISER0", "UInt32"));
        sizes.add(Global.newArray("ISER1", "UInt32"));
        sizes.add(Global.newArray("iprRegs", "Sti.sysbios.family.arm.ducati.omap4430.Power;IPRxRegs"));
        sizes.add(Global.newArray("cfgRegs", "Sti.sysbios.family.arm.ducati.omap4430.Power;CfgRegs"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("largeAddr", "A4;UInt32"));
        sizes.add(Global.newArray("largeXlteAddr", "A4;UInt32"));
        sizes.add(Global.newArray("largePolicy", "A4;UInt32"));
        sizes.add(Global.newArray("medAddr", "A2;UInt32"));
        sizes.add(Global.newArray("medXlteAddr", "A2;UInt32"));
        sizes.add(Global.newArray("medPolicy", "A2;UInt32"));
        sizes.add(Global.newArray("smallAddr", "Sti.sysbios.family.arm.ducati.omap4430.Power;Struct10"));
        sizes.add(Global.newArray("smallXlteAddr", "Sti.sysbios.family.arm.ducati.omap4430.Power;Struct10"));
        sizes.add(Global.newArray("smallPolicy", "Sti.sysbios.family.arm.ducati.omap4430.Power;Struct10"));
        sizes.add(Global.newArray("mmuConfig", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("CNTL", "UInt32"));
        sizes.add(Global.newArray("STMCNTL", "UInt32"));
        sizes.add(Global.newArray("STMMSTID", "UInt32"));
        sizes.add(Global.newArray("STMINTVL", "UInt32"));
        sizes.add(Global.newArray("STMSEL0", "UInt32"));
        sizes.add(Global.newArray("TINTVLR0", "UInt32"));
        sizes.add(Global.newArray("TINTVLR1", "UInt32"));
        sizes.add(Global.newArray("GNBL0", "UInt32"));
        sizes.add(Global.newArray("control", "Sti.sysbios.family.arm.ducati.omap4430.Power;Struct8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("R4", "UInt32"));
        sizes.add(Global.newArray("R5", "UInt32"));
        sizes.add(Global.newArray("R6", "UInt32"));
        sizes.add(Global.newArray("R7", "UInt32"));
        sizes.add(Global.newArray("R8", "UInt32"));
        sizes.add(Global.newArray("R9", "UInt32"));
        sizes.add(Global.newArray("R10", "UInt32"));
        sizes.add(Global.newArray("R11", "UInt32"));
        sizes.add(Global.newArray("LR", "UInt32"));
        sizes.add(Global.newArray("CONTROL", "UInt32"));
        sizes.add(Global.newArray("BASEPRI", "UInt32"));
        sizes.add(Global.newArray("MSP", "UInt32"));
        sizes.add(Global.newArray("pSP", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("privateCPU", "Sti.sysbios.family.arm.ducati.omap4430.Power;CpuRegs"));
        sizes.add(Global.newArray("privateNVIC", "Sti.sysbios.family.arm.ducati.omap4430.Power;NVICContext"));
        sizes.add(Global.newArray("privatePIDS", "Sti.sysbios.family.arm.ducati.omap4430.Power;TablePIDS"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("L1_CONFIG", "UInt32"));
        sizes.add(Global.newArray("L1_OCP", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("cacheConfig", "Sti.sysbios.family.arm.ducati.omap4430.Power;UnicacheConfig"));
        sizes.add(Global.newArray("ammuConfig", "Sti.sysbios.family.arm.ducati.omap4430.Power;ContextAMMU"));
        sizes.add(Global.newArray("ctmConfig", "Sti.sysbios.family.arm.ducati.omap4430.Power;ContextCTM"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("masterContext", "Sti.sysbios.family.arm.ducati.omap4430.Power;PrivateContext"));
        sizes.add(Global.newArray("slaveContext", "Sti.sysbios.family.arm.ducati.omap4430.Power;PrivateContext"));
        sizes.add(Global.newArray("ssContext", "Sti.sysbios.family.arm.ducati.omap4430.Power;SubsystemContext"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs", "ti.sysbios.family.arm.ducati.omap4430");
        sizes.clear();
        sizes.add(Global.newArray("CCR", "UInt32"));
        sizes.add(Global.newArray("CLNK", "UInt32"));
        sizes.add(Global.newArray("CICR", "UInt32"));
        sizes.add(Global.newArray("CSR", "UInt32"));
        sizes.add(Global.newArray("CSDP", "UInt32"));
        sizes.add(Global.newArray("CEN", "UInt32"));
        sizes.add(Global.newArray("CFN", "UInt32"));
        sizes.add(Global.newArray("CSSA", "UInt32"));
        sizes.add(Global.newArray("CDSA", "UInt32"));
        sizes.add(Global.newArray("CSEI", "UInt32"));
        sizes.add(Global.newArray("CSFI", "UInt32"));
        sizes.add(Global.newArray("CDEI", "UInt32"));
        sizes.add(Global.newArray("CDFI", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Power$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/omap4430/Power.xs");
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Module", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.ducati.omap4430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("L2RAM", new Proto.Adr("xdc_Ptr", "Pv"), 0x55020000L, "rh");
        if (isCFG) {
            po.addFld("sdmaRegs", new Proto.Adr("xdc_Ptr", "Pv"), 0x4A056000L, "w");
            po.addFld("rendezvousGateIndex", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "w");
            po.addFld("idle", $$T_Bool, false, "w");
            po.addFld("loadSegment", $$T_Str, "EXT_SHARED_RAM", "wh");
            po.addFld("preSuspendHooks", new Proto.Arr(new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("postSuspendHooks", new Proto.Arr(new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("rendezvousGate", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Handle", "ti.sysbios.family.arm.ducati.omap4430"), $$UNDEF, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.omap4430.Power$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // typedef Power.SuspendFuncHookPtr
        om.bind("ti.sysbios.family.arm.ducati.omap4430.Power.SuspendFuncHookPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Power.SuspendArgs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$SuspendArgs", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("pmMasterCore", $$T_Bool, $$UNDEF, "w");
                po.addFld("rendezvousResume", $$T_Bool, $$UNDEF, "w");
                po.addFld("dmaChannel", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("intMask31_0", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("intMask63_32", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("intMask79_64", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Power.Struct8
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$Struct8", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.Struct8", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("a0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a4", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a5", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a6", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a7", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.Struct10
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$Struct10", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("a0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a4", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a5", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a6", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a7", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a8", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("a9", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.TablePIDS
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$TablePIDS", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("PID1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PID2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.IPRxRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$IPRxRegs", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("IPR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR4", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR5", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR6", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR7", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR8", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR9", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR10", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR11", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR12", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR13", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR14", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IPR15", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.CfgRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$CfgRegs", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("VTOR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("AIRCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SHPR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SHPR4", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SHPR8", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SHCSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.NVICContext
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$NVICContext", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("AUXCTRL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("STCSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("STRVR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISER0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISER1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("iprRegs", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("cfgRegs", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
        // struct Power.ContextAMMU
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$ContextAMMU", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("largeAddr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("largeXlteAddr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("largePolicy", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("medAddr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("medXlteAddr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("medPolicy", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("smallAddr", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("smallXlteAddr", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("smallPolicy", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("mmuConfig", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.ContextCTM
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$ContextCTM", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("STMCNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("STMMSTID", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("STMINTVL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("STMSEL0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TINTVLR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TINTVLR1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GNBL0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("control", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct8", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
        // struct Power.CpuRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$CpuRegs", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("R4", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("R5", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("R6", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("R7", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("R8", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("R9", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("R10", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("R11", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("LR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CONTROL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BASEPRI", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MSP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("pSP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.PrivateContext
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$PrivateContext", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("privateCPU", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("privateNVIC", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("privatePIDS", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
        // struct Power.UnicacheConfig
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$UnicacheConfig", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("L1_CONFIG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1_OCP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Power.SubsystemContext
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$SubsystemContext", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("cacheConfig", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("ammuConfig", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("ctmConfig", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
        // struct Power.DucatiContext
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$DucatiContext", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("masterContext", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("slaveContext", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
                po.addFld("ssContext", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext", "ti.sysbios.family.arm.ducati.omap4430"), $$DEFAULT, "w");
        // struct Power.SdmaRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$SdmaRegs", "ti.sysbios.family.arm.ducati.omap4430");
        po.init("ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CLNK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CICR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CSDP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CEN", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CFN", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CSSA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CDSA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CSEI", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CSFI", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CDEI", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CDFI", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
    }

    void Power$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("SuspendArgs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$SuspendArgs", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("Struct8$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.Struct8", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$Struct8", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("Struct10$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$Struct10", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("TablePIDS$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$TablePIDS", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("IPRxRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$IPRxRegs", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("CfgRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$CfgRegs", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("NVICContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$NVICContext", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("ContextAMMU$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$ContextAMMU", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("ContextCTM$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$ContextCTM", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("CpuRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$CpuRegs", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("PrivateContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$PrivateContext", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("UnicacheConfig$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$UnicacheConfig", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("SubsystemContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$SubsystemContext", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("DucatiContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$DucatiContext", "ti.sysbios.family.arm.ducati.omap4430");
        vo.bind("SdmaRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$SdmaRegs", "ti.sysbios.family.arm.ducati.omap4430");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.ducati.omap4430.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.ducati.omap4430"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/omap4430/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.ducati.omap4430"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.ducati.omap4430"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.ducati.omap4430"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.ducati.omap4430"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.ducati.omap4430"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.ducati.omap4430"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.ducati.omap4430", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.ducati.omap4430");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.ducati.omap4430.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.ducati.omap4430'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.ducati.omap4430$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.ducati.omap4430$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.ducati.omap4430$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.omap4430.aem3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.omap4430.aem4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.omap4430.am3g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.omap4430.am4g',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.omap4430.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.omap4430.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.omap4430.am3g', {target: 'gnu.targets.arm.M3', suffix: 'm3g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.omap4430.am4g', {target: 'gnu.targets.arm.M4', suffix: 'm4g'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Power$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power", "ti.sysbios.family.arm.ducati.omap4430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Module", "ti.sysbios.family.arm.ducati.omap4430");
        vo.init2(po, "ti.sysbios.family.arm.ducati.omap4430.Power", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power$$capsule", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati.omap4430", "ti.sysbios.family.arm.ducati.omap4430"));
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
        vo.bind("SuspendFuncHookPtr", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SuspendFuncHookPtr", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("SuspendArgs", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SuspendArgs", "ti.sysbios.family.arm.ducati.omap4430"));
        mcfgs.add("sdmaRegs");
        mcfgs.add("rendezvousGateIndex");
        mcfgs.add("idle");
        mcfgs.add("preSuspendHooks");
        mcfgs.add("postSuspendHooks");
        vo.bind("Struct8", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct8", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct8", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("Struct10", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.Struct10", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("TablePIDS", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.TablePIDS", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("IPRxRegs", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.IPRxRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("CfgRegs", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.CfgRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("NVICContext", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.NVICContext", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("ContextAMMU", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.ContextAMMU", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("ContextCTM", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.ContextCTM", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("CpuRegs", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.CpuRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("PrivateContext", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.PrivateContext", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("UnicacheConfig", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.UnicacheConfig", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("SubsystemContext", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SubsystemContext", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("DucatiContext", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.DucatiContext", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("SdmaRegs", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.SdmaRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        mcfgs.add("rendezvousGate");
        icfgs.add("rendezvousGate");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati.omap4430")).add(vo);
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
        vo.bind("idleCPU", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.idleCPU", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("suspend", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.suspend", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("resetFxn", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.resetFxn", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("saveCpuRegs", om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power.saveCpuRegs", "ti.sysbios.family.arm.ducati.omap4430"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_omap4430_Power_Module__startupDone__E", "ti_sysbios_family_arm_ducati_omap4430_Power_idleCPU__E", "ti_sysbios_family_arm_ducati_omap4430_Power_suspend__E"));
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
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.omap4430.Power", "ti.sysbios.family.arm.ducati.omap4430"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.omap4430.Power")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.ducati.omap4430")).add(pkgV);
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
