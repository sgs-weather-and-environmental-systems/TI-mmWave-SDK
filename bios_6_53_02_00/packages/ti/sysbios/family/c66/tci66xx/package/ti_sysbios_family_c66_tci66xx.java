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

public class ti_sysbios_family_c66_tci66xx
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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.c66.tci66xx.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.c66.tci66xx", new Value.Obj("ti.sysbios.family.c66.tci66xx", pkgP));
    }

    void CpIntc$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc", new Value.Obj("ti.sysbios.family.c66.tci66xx.CpIntc", po));
        pkgV.bind("CpIntc", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$SysIntsView", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntsView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$RegisterMap", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$SysIntObj", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$HostIntObj", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.HostIntObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$DispatchTabElem", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.Module_State", new Proto.Str(spo, false));
    }

    void CpIntc$$CONSTS()
    {
        // module CpIntc
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.clearSysInt", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_clearSysInt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.disableAllHostInts", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_disableAllHostInts__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.disableHostInt", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_disableHostInt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.disableSysInt", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_disableSysInt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.dispatch", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_dispatch__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.dispatchPlug", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_dispatchPlug__E", "xdc_Void(*)(xdc_UInt,xdc_Void(*)(xdc_UArg),xdc_UArg,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.enableAllHostInts", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_enableAllHostInts__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.enableHostInt", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_enableHostInt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.enableSysInt", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_enableSysInt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.getEventId", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_getEventId__E", "xdc_Int(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.getHostInt", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_getHostInt__E", "xdc_Int(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.mapSysIntToHostInt", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_mapSysIntToHostInt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.postSysInt", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_postSysInt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.unused", new Extern("ti_sysbios_family_c66_tci66xx_CpIntc_unused__E", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void CpIntc$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void CpIntc$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn CpIntc.getEventIdMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$getEventIdMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.Module", "ti.sysbios.family.c66.tci66xx"), Proto.Elm.newCNum("(xdc_Int)"), 1, 1, false));
                fxn.addArg(0, "hostInt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn CpIntc.mapHostIntToEventCombinerMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$mapHostIntToEventCombinerMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.Module", "ti.sysbios.family.c66.tci66xx"), null, 1, 1, false));
                fxn.addArg(0, "hostInt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn CpIntc.mapHostIntToHwiMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$mapHostIntToHwiMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.Module", "ti.sysbios.family.c66.tci66xx"), null, 2, 2, false));
                fxn.addArg(0, "hostInt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "hwiNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
    }

    void CpIntc$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap", "ti.sysbios.family.c66.tci66xx");
        sizes.clear();
        sizes.add(Global.newArray("REV", "UInt32"));
        sizes.add(Global.newArray("CR", "UInt32"));
        sizes.add(Global.newArray("RES_08", "UInt32"));
        sizes.add(Global.newArray("HCR", "UInt32"));
        sizes.add(Global.newArray("GER", "UInt32"));
        sizes.add(Global.newArray("RES_14", "UInt32"));
        sizes.add(Global.newArray("RES_18", "UInt32"));
        sizes.add(Global.newArray("GNLR", "UInt32"));
        sizes.add(Global.newArray("SISR", "UInt32"));
        sizes.add(Global.newArray("SICR", "UInt32"));
        sizes.add(Global.newArray("EISR", "UInt32"));
        sizes.add(Global.newArray("EICR", "UInt32"));
        sizes.add(Global.newArray("GWER", "UInt32"));
        sizes.add(Global.newArray("HIEISR", "UInt32"));
        sizes.add(Global.newArray("HIDISR", "UInt32"));
        sizes.add(Global.newArray("RES_3C", "UInt32"));
        sizes.add(Global.newArray("PPR", "UInt32"));
        sizes.add(Global.newArray("RES_44", "UInt32"));
        sizes.add(Global.newArray("RES_48", "UInt32"));
        sizes.add(Global.newArray("RES_4C", "UInt32"));
        sizes.add(Global.newArray("VBR", "UPtr"));
        sizes.add(Global.newArray("VSR", "UInt32"));
        sizes.add(Global.newArray("VNR", "UPtr"));
        sizes.add(Global.newArray("RES_5C", "A9;UInt32"));
        sizes.add(Global.newArray("GPIR", "TInt32"));
        sizes.add(Global.newArray("GPVR", "UPtr"));
        sizes.add(Global.newArray("RES_88", "UInt32"));
        sizes.add(Global.newArray("RES_8C", "UInt32"));
        sizes.add(Global.newArray("GSIER", "UInt32"));
        sizes.add(Global.newArray("SPIR", "UInt32"));
        sizes.add(Global.newArray("RES_98", "A26;UInt32"));
        sizes.add(Global.newArray("PPMR", "A64;UInt32"));
        sizes.add(Global.newArray("SRSR", "A32;UInt32"));
        sizes.add(Global.newArray("SECR", "A32;UInt32"));
        sizes.add(Global.newArray("ESR", "A32;UInt32"));
        sizes.add(Global.newArray("ECR", "A32;UInt32"));
        sizes.add(Global.newArray("CMR", "A1024;UInt8"));
        sizes.add(Global.newArray("HIMR", "A256;UInt8"));
        sizes.add(Global.newArray("HIPIR", "A256;UInt32"));
        sizes.add(Global.newArray("PR", "A32;UInt32"));
        sizes.add(Global.newArray("TR", "A32;UInt32"));
        sizes.add(Global.newArray("WER", "A64;UInt32"));
        sizes.add(Global.newArray("DSR", "A64;UInt32"));
        sizes.add(Global.newArray("SER", "A32;UInt32"));
        sizes.add(Global.newArray("SDR", "A32;UInt32"));
        sizes.add(Global.newArray("HINLR", "A256;UInt32"));
        sizes.add(Global.newArray("HIER", "A8;UInt32"));
        sizes.add(Global.newArray("RES1520", "A56;UInt32"));
        sizes.add(Global.newArray("HIPVR", "A256;UPtr"));
        sizes.add(Global.newArray("RES1A00", "A384;UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem", "ti.sysbios.family.c66.tci66xx");
        sizes.clear();
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("arg", "UIArg"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.Module_State", "ti.sysbios.family.c66.tci66xx");
        sizes.clear();
        sizes.add(Global.newArray("controller", "UPtr"));
        sizes.add(Global.newArray("initSIER", "UPtr"));
        sizes.add(Global.newArray("hostIntToSysInt", "UPtr"));
        sizes.add(Global.newArray("dispatchTab", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.tci66xx.CpIntc.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void CpIntc$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c66/tci66xx/CpIntc.xs");
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.Module", "ti.sysbios.family.c66.tci66xx");
        po.init("ti.sysbios.family.c66.tci66xx.CpIntc.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.c66.tci66xx"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c66.tci66xx"), $$UNDEF, "wh");
            po.addFld("E_unpluggedSysInt", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c66.tci66xx"), Global.newObject("msg", "E_unpluggedSysInt: System Interrupt# %d is unplugged"), "w");
            po.addFld("sysInts", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntObj", "ti.sysbios.family.c66.tci66xx"), false), $$DEFAULT, "wh");
            po.addFld("hostInts", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.HostIntObj", "ti.sysbios.family.c66.tci66xx"), false), $$DEFAULT, "wh");
            po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("numSysInts", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("numEvents", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("numStatusRegs", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
            po.addFld("sysIntToHostInt", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt16)"), false), $$DEFAULT, "w");
            po.addFld("hostIntToEventId", new Proto.Arr(new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false), false), $$DEFAULT, "w");
            po.addFld("eventId", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false), $$DEFAULT, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c66.tci66xx.CpIntc$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("getEventIdMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$getEventIdMeta", "ti.sysbios.family.c66.tci66xx"), Global.get(cap, "getEventIdMeta"));
                po.addFxn("mapHostIntToEventCombinerMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$mapHostIntToEventCombinerMeta", "ti.sysbios.family.c66.tci66xx"), Global.get(cap, "mapHostIntToEventCombinerMeta"));
                po.addFxn("mapHostIntToHwiMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$mapHostIntToHwiMeta", "ti.sysbios.family.c66.tci66xx"), Global.get(cap, "mapHostIntToHwiMeta"));
        // struct CpIntc.SysIntsView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$SysIntsView", "ti.sysbios.family.c66.tci66xx");
        po.init("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntsView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("systemInt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("hostInt", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", $$T_Str, $$UNDEF, "w");
                po.addFld("enabled", $$T_Bool, $$UNDEF, "w");
        // typedef CpIntc.FuncPtr
        om.bind("ti.sysbios.family.c66.tci66xx.CpIntc.FuncPtr", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"));
        // struct CpIntc.RegisterMap
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$RegisterMap", "ti.sysbios.family.c66.tci66xx");
        po.init("ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("REV", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_08", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_14", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_18", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GNLR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SICR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EICR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GWER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HIEISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HIDISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_3C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PPR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_44", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_48", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_4C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("VBR", new Proto.Adr("xdc_Ptr*", "PPv"), $$UNDEF, "w");
                po.addFld("VSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("VNR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("RES_5C", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(9L)), $$DEFAULT, "w");
                po.addFld("GPIR", Proto.Elm.newCNum("(xdc_Int32)"), $$UNDEF, "w");
                po.addFld("GPVR", new Proto.Adr("xdc_Ptr*", "PPv"), $$UNDEF, "w");
                po.addFld("RES_88", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_8C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GSIER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SPIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_98", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(26L)), $$DEFAULT, "w");
                po.addFld("PPMR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("SRSR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("SECR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ESR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ECR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("CMR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(1024L)), $$DEFAULT, "w");
                po.addFld("HIMR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
                po.addFld("HIPIR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
                po.addFld("PR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("TR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("WER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("DSR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("SER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("SDR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("HINLR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
                po.addFld("HIER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("RES1520", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(56L)), $$DEFAULT, "w");
                po.addFld("HIPVR", new Proto.Arr(new Proto.Adr("xdc_Ptr*", "PPv"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
                po.addFld("RES1A00", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(384L)), $$DEFAULT, "w");
        // struct CpIntc.SysIntObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$SysIntObj", "ti.sysbios.family.c66.tci66xx");
        po.init("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hostInt", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("enable", $$T_Bool, $$UNDEF, "w");
        // struct CpIntc.HostIntObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$HostIntObj", "ti.sysbios.family.c66.tci66xx");
        po.init("ti.sysbios.family.c66.tci66xx.CpIntc.HostIntObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("hwiNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("useEventCombiner", $$T_Bool, $$UNDEF, "w");
        // struct CpIntc.DispatchTabElem
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$DispatchTabElem", "ti.sysbios.family.c66.tci66xx");
        po.init("ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
        // struct CpIntc.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$Module_State", "ti.sysbios.family.c66.tci66xx");
        po.init("ti.sysbios.family.c66.tci66xx.CpIntc.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("controller", new Proto.Arr(new Proto.Adr("ti_sysbios_family_c66_tci66xx_CpIntc_RegisterMap*", "PS"), false), $$DEFAULT, "w");
                po.addFld("initSIER", new Proto.Arr(Proto.Elm.newCNum("(xdc_Bits32)"), false), $$DEFAULT, "w");
                po.addFld("hostIntToSysInt", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt16)"), false), $$DEFAULT, "w");
                po.addFld("dispatchTab", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem", "ti.sysbios.family.c66.tci66xx"), false), $$DEFAULT, "w");
    }

    void CpIntc$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc", "ti.sysbios.family.c66.tci66xx");
        vo.bind("RegisterMap$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$RegisterMap", "ti.sysbios.family.c66.tci66xx");
        vo.bind("DispatchTabElem$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$DispatchTabElem", "ti.sysbios.family.c66.tci66xx");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.tci66xx.CpIntc.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$Module_State", "ti.sysbios.family.c66.tci66xx");
        po.bind("initSIER$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bits32", "isScalar", true));
        po.bind("hostIntToSysInt$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt16", "isScalar", true));
        po.bind("dispatchTab$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem", "isScalar", false));
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.c66.tci66xx.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.c66.tci66xx"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c66/tci66xx/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.c66.tci66xx"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.c66.tci66xx"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.c66.tci66xx"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.c66.tci66xx"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.c66.tci66xx"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.c66.tci66xx"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.c66.tci66xx", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.c66.tci66xx");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.c66.tci66xx.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.c66.tci66xx'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.c66.tci66xx$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.c66.tci66xx$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.c66.tci66xx$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c66.tci66xx.ae66',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c66.tci66xx.ae66e',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c66.tci66xx.ae66', {target: 'ti.targets.elf.C66', suffix: 'e66'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c66.tci66xx.ae66e', {target: 'ti.targets.elf.C66_big_endian', suffix: 'e66e'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void CpIntc$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc", "ti.sysbios.family.c66.tci66xx");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.Module", "ti.sysbios.family.c66.tci66xx");
        vo.init2(po, "ti.sysbios.family.c66.tci66xx.CpIntc", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc$$capsule", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c66.tci66xx", "ti.sysbios.family.c66.tci66xx"));
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
        vo.bind("SysIntsView", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntsView", "ti.sysbios.family.c66.tci66xx"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntsView", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.FuncPtr", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("RegisterMap", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap", "ti.sysbios.family.c66.tci66xx"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.RegisterMap", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("SysIntObj", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntObj", "ti.sysbios.family.c66.tci66xx"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.SysIntObj", "ti.sysbios.family.c66.tci66xx"));
        mcfgs.add("E_unpluggedSysInt");
        vo.bind("HostIntObj", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.HostIntObj", "ti.sysbios.family.c66.tci66xx"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.HostIntObj", "ti.sysbios.family.c66.tci66xx"));
        icfgs.add("hostInts");
        icfgs.add("baseAddr");
        mcfgs.add("numSysInts");
        icfgs.add("numSysInts");
        mcfgs.add("numEvents");
        icfgs.add("numEvents");
        mcfgs.add("numStatusRegs");
        icfgs.add("numStatusRegs");
        mcfgs.add("sysIntToHostInt");
        icfgs.add("sysIntToHostInt");
        mcfgs.add("hostIntToEventId");
        icfgs.add("hostIntToEventId");
        mcfgs.add("eventId");
        icfgs.add("eventId");
        vo.bind("DispatchTabElem", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem", "ti.sysbios.family.c66.tci66xx"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.DispatchTabElem", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.Module_State", "ti.sysbios.family.c66.tci66xx"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.Module_State", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c66.tci66xx")).add(vo);
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
        vo.bind("clearSysInt", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.clearSysInt", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("disableAllHostInts", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.disableAllHostInts", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("disableHostInt", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.disableHostInt", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("disableSysInt", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.disableSysInt", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("dispatch", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.dispatch", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("dispatchPlug", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.dispatchPlug", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("enableAllHostInts", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.enableAllHostInts", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("enableHostInt", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.enableHostInt", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("enableSysInt", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.enableSysInt", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("getEventId", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.getEventId", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("getHostInt", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.getHostInt", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("mapSysIntToHostInt", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.mapSysIntToHostInt", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("postSysInt", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.postSysInt", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("unused", om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc.unused", "ti.sysbios.family.c66.tci66xx"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c66_tci66xx_CpIntc_Module__startupDone__E", "ti_sysbios_family_c66_tci66xx_CpIntc_clearSysInt__E", "ti_sysbios_family_c66_tci66xx_CpIntc_disableAllHostInts__E", "ti_sysbios_family_c66_tci66xx_CpIntc_disableHostInt__E", "ti_sysbios_family_c66_tci66xx_CpIntc_disableSysInt__E", "ti_sysbios_family_c66_tci66xx_CpIntc_dispatch__E", "ti_sysbios_family_c66_tci66xx_CpIntc_dispatchPlug__E", "ti_sysbios_family_c66_tci66xx_CpIntc_enableAllHostInts__E", "ti_sysbios_family_c66_tci66xx_CpIntc_enableHostInt__E", "ti_sysbios_family_c66_tci66xx_CpIntc_enableSysInt__E", "ti_sysbios_family_c66_tci66xx_CpIntc_getEventId__E", "ti_sysbios_family_c66_tci66xx_CpIntc_getHostInt__E", "ti_sysbios_family_c66_tci66xx_CpIntc_mapSysIntToHostInt__E", "ti_sysbios_family_c66_tci66xx_CpIntc_postSysInt__E", "ti_sysbios_family_c66_tci66xx_CpIntc_unused__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_unpluggedSysInt"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("CpIntc", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("CpIntc");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc", "ti.sysbios.family.c66.tci66xx"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c66.tci66xx.CpIntc", "ti.sysbios.family.c66.tci66xx");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"SysInts", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitSystemInts", "structName", "SysIntsView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.c66.tci66xx.CpIntc")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.c66.tci66xx")).add(pkgV);
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
        CpIntc$$OBJECTS();
        CpIntc$$CONSTS();
        CpIntc$$CREATES();
        CpIntc$$FUNCTIONS();
        CpIntc$$SIZES();
        CpIntc$$TYPES();
        if (isROV) {
            CpIntc$$ROV();
        }//isROV
        $$SINGLETONS();
        CpIntc$$SINGLETONS();
        $$INITIALIZATION();
    }
}
