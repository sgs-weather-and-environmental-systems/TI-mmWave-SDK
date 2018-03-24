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

public class ti_sysbios_family_c66
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.c66.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.c66", new Value.Obj("ti.sysbios.family.c66", pkgP));
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c66.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c66.Cache", new Value.Obj("ti.sysbios.family.c66.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.family.c66.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.c66"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.Cache$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.Cache.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.Cache$$MarRegisterView", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.Cache.MarRegisterView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.c66.Cache.Mode", new Proto.Enm("ti.sysbios.family.c66.Cache.Mode"));
        om.bind("ti.sysbios.family.c66.Cache.L1Size", new Proto.Enm("ti.sysbios.family.c66.Cache.L1Size"));
        om.bind("ti.sysbios.family.c66.Cache.L2Size", new Proto.Enm("ti.sysbios.family.c66.Cache.L2Size"));
        om.bind("ti.sysbios.family.c66.Cache.Mar", new Proto.Enm("ti.sysbios.family.c66.Cache.Mar"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c66.Cache$$Size", new Proto.Obj());
        om.bind("ti.sysbios.family.c66.Cache.Size", new Proto.Str(spo, false));
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.family.c66.Cache.Mode_FREEZE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.Mode", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.Mode_FREEZE", 0));
        om.bind("ti.sysbios.family.c66.Cache.Mode_BYPASS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.Mode", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.Mode_BYPASS", 1));
        om.bind("ti.sysbios.family.c66.Cache.Mode_NORMAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.Mode", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.Mode_NORMAL", 2));
        om.bind("ti.sysbios.family.c66.Cache.L1Size_0K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L1Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L1Size_0K", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L1Size_4K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L1Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L1Size_4K", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L1Size_8K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L1Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L1Size_8K", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L1Size_16K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L1Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L1Size_16K", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L1Size_32K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L1Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L1Size_32K", xdc.services.intern.xsr.Enum.intValue(4L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L2Size_0K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L2Size_0K", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L2Size_32K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L2Size_32K", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L2Size_64K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L2Size_64K", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L2Size_128K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L2Size_128K", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L2Size_256K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L2Size_256K", xdc.services.intern.xsr.Enum.intValue(4L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L2Size_512K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L2Size_512K", xdc.services.intern.xsr.Enum.intValue(5L)+0));
        om.bind("ti.sysbios.family.c66.Cache.L2Size_1024K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.L2Size_1024K", xdc.services.intern.xsr.Enum.intValue(6L)+0));
        om.bind("ti.sysbios.family.c66.Cache.Mar_DISABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.Mar", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.Mar_DISABLE", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c66.Cache.Mar_ENABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c66.Cache.Mar", "ti.sysbios.family.c66"), "ti.sysbios.family.c66.Cache.Mar_ENABLE", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c66.Cache.PC", 1L);
        om.bind("ti.sysbios.family.c66.Cache.WTE", 2L);
        om.bind("ti.sysbios.family.c66.Cache.PCX", 4L);
        om.bind("ti.sysbios.family.c66.Cache.PFX", 8L);
        om.bind("ti.sysbios.family.c66.Cache.L2CFG", 0x01840000L);
        om.bind("ti.sysbios.family.c66.Cache.L1PCFG", 0x01840020L);
        om.bind("ti.sysbios.family.c66.Cache.L1PCC", 0x01840024L);
        om.bind("ti.sysbios.family.c66.Cache.L1DCFG", 0x01840040L);
        om.bind("ti.sysbios.family.c66.Cache.L1DCC", 0x01840044L);
        om.bind("ti.sysbios.family.c66.Cache.MAR", 0x01848000L);
        om.bind("ti.sysbios.family.c66.Cache.enable", new Extern("ti_sysbios_family_c66_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.wait", new Extern("ti_sysbios_family_c66_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.disable", new Extern("ti_sysbios_family_c66_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.getMode", new Extern("ti_sysbios_family_c66_Cache_getMode__E", "ti_sysbios_family_c66_Cache_Mode(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.setMode", new Extern("ti_sysbios_family_c66_Cache_setMode__E", "ti_sysbios_family_c66_Cache_Mode(*)(xdc_Bits16,ti_sysbios_family_c66_Cache_Mode)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.getSize", new Extern("ti_sysbios_family_c66_Cache_getSize__E", "xdc_Void(*)(ti_sysbios_family_c66_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.setSize", new Extern("ti_sysbios_family_c66_Cache_setSize__E", "xdc_Void(*)(ti_sysbios_family_c66_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.getMar", new Extern("ti_sysbios_family_c66_Cache_getMar__E", "xdc_UInt32(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.setMar", new Extern("ti_sysbios_family_c66_Cache_setMar__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.inv", new Extern("ti_sysbios_family_c66_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.wb", new Extern("ti_sysbios_family_c66_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.wbInv", new Extern("ti_sysbios_family_c66_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.invL1pAll", new Extern("ti_sysbios_family_c66_Cache_invL1pAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.wbAll", new Extern("ti_sysbios_family_c66_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.wbL1dAll", new Extern("ti_sysbios_family_c66_Cache_wbL1dAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.wbInvAll", new Extern("ti_sysbios_family_c66_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.wbInvL1dAll", new Extern("ti_sysbios_family_c66_Cache_wbInvL1dAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.RTSSynchInv", new Extern("ti_sysbios_family_c66_Cache_RTSSynchInv__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.RTSSynchWb", new Extern("ti_sysbios_family_c66_Cache_RTSSynchWb__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.RTSSynchWbInv", new Extern("ti_sysbios_family_c66_Cache_RTSSynchWbInv__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.invPrefetchBuffer", new Extern("ti_sysbios_family_c66_Cache_invPrefetchBuffer__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.all", new Extern("ti_sysbios_family_c66_Cache_all__I", "xdc_Void(*)(xdc_UInt32*)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.block", new Extern("ti_sysbios_family_c66_Cache_block__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_UInt32*)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.getL1DInitSize", new Extern("ti_sysbios_family_c66_Cache_getL1DInitSize__I", "xdc_Void(*)(ti_sysbios_family_c66_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.getL1PInitSize", new Extern("ti_sysbios_family_c66_Cache_getL1PInitSize__I", "xdc_Void(*)(ti_sysbios_family_c66_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.getL2InitSize", new Extern("ti_sysbios_family_c66_Cache_getL2InitSize__I", "xdc_Void(*)(ti_sysbios_family_c66_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c66.Cache.startup", new Extern("ti_sysbios_family_c66_Cache_startup__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void Cache$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Cache.getMarMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c66.Cache$$getMarMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c66.Cache.Module", "ti.sysbios.family.c66"), Proto.Elm.newCNum("(xdc_UInt32)"), 1, 1, false));
                fxn.addArg(0, "baseAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
        // fxn Cache.setMarMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c66.Cache$$setMarMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c66.Cache.Module", "ti.sysbios.family.c66"), null, 3, 3, false));
                fxn.addArg(0, "baseAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(1, "byteSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF);
                fxn.addArg(2, "value", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF);
    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c66.Cache.Size", "ti.sysbios.family.c66");
        sizes.clear();
        sizes.add(Global.newArray("l1pSize", "Nti.sysbios.family.c66.Cache.L1Size;;0;1;2;3;4"));
        sizes.add(Global.newArray("l1dSize", "Nti.sysbios.family.c66.Cache.L1Size;;0;1;2;3;4"));
        sizes.add(Global.newArray("l2Size", "Nti.sysbios.family.c66.Cache.L2Size;;0;1;2;3;4;5;6"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c66.Cache.Size']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c66.Cache.Size']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c66.Cache.Size'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c66/Cache.xs");
        om.bind("ti.sysbios.family.c66.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.Cache.Module", "ti.sysbios.family.c66");
        po.init("ti.sysbios.family.c66.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.family.c66"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("PC", Proto.Elm.newCNum("(xdc_UInt32)"), 1L, "rh");
                po.addFld("WTE", Proto.Elm.newCNum("(xdc_UInt32)"), 2L, "rh");
                po.addFld("PCX", Proto.Elm.newCNum("(xdc_UInt32)"), 4L, "rh");
                po.addFld("PFX", Proto.Elm.newCNum("(xdc_UInt32)"), 8L, "rh");
                po.addFld("L2CFG", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840000L, "rh");
                po.addFld("L1PCFG", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840020L, "rh");
                po.addFld("L1PCC", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840024L, "rh");
                po.addFld("L1DCFG", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840040L, "rh");
                po.addFld("L1DCC", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840044L, "rh");
                po.addFld("MAR", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01848000L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c66"), $$UNDEF, "wh");
            po.addFld("initSize", (Proto)om.findStrict("ti.sysbios.family.c66.Cache.Size", "ti.sysbios.family.c66"), Global.newObject("l1pSize", om.find("ti.sysbios.family.c66.Cache.L1Size_32K"), "l1dSize", om.find("ti.sysbios.family.c66.Cache.L1Size_32K"), "l2Size", om.find("ti.sysbios.family.c66.Cache.L2Size_0K")), "w");
            po.addFld("MAR0_31", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("MAR32_63", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("MAR64_95", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("MAR96_127", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("MAR128_159", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("MAR160_191", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("MAR192_223", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("MAR224_255", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("E_invalidL1CacheSize", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c66"), Global.newObject("msg", "E_invalidL1CacheSize: Invalid L1 cache size %d"), "w");
            po.addFld("E_invalidL2CacheSize", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c66"), Global.newObject("msg", "E_invalidL2CacheSize: Invalid L2 cache size %d"), "w");
            po.addFld("atomicBlockSize", Proto.Elm.newCNum("(xdc_UInt32)"), 1024L, "w");
            po.addFld("registerRTSSynch", $$T_Bool, false, "w");
            po.addFld("marvalues", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c66.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c66.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c66.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c66.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("getMarMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c66.Cache$$getMarMeta", "ti.sysbios.family.c66"), Global.get(cap, "getMarMeta"));
                po.addFxn("setMarMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c66.Cache$$setMarMeta", "ti.sysbios.family.c66"), Global.get(cap, "setMarMeta"));
        // struct Cache.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.Cache$$ModuleView", "ti.sysbios.family.c66");
        po.init("ti.sysbios.family.c66.Cache.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("L1PCacheSize", $$T_Str, $$UNDEF, "w");
                po.addFld("L1PMode", $$T_Str, $$UNDEF, "w");
                po.addFld("L1DCacheSize", $$T_Str, $$UNDEF, "w");
                po.addFld("L1DMode", $$T_Str, $$UNDEF, "w");
                po.addFld("L2CacheSize", $$T_Str, $$UNDEF, "w");
                po.addFld("L2Mode", $$T_Str, $$UNDEF, "w");
        // struct Cache.MarRegisterView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.Cache$$MarRegisterView", "ti.sysbios.family.c66");
        po.init("ti.sysbios.family.c66.Cache.MarRegisterView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("number", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("startAddrRange", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("endAddrRange", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("cacheable", $$T_Bool, $$UNDEF, "w");
                po.addFld("prefetchable", $$T_Bool, $$UNDEF, "w");
                po.addFld("marRegisterValue", $$T_Str, $$UNDEF, "w");
        // struct Cache.Size
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.Cache$$Size", "ti.sysbios.family.c66");
        po.init("ti.sysbios.family.c66.Cache.Size", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("l1pSize", (Proto)om.findStrict("ti.sysbios.family.c66.Cache.L1Size", "ti.sysbios.family.c66"), $$UNDEF, "w");
                po.addFld("l1dSize", (Proto)om.findStrict("ti.sysbios.family.c66.Cache.L1Size", "ti.sysbios.family.c66"), $$UNDEF, "w");
                po.addFld("l2Size", (Proto)om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"), $$UNDEF, "w");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c66.Cache", "ti.sysbios.family.c66");
        vo.bind("Size$fetchDesc", Global.newObject("type", "ti.sysbios.family.c66.Cache.Size", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.Cache$$Size", "ti.sysbios.family.c66");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.c66.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.c66"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c66/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.c66"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.c66"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.c66"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.c66"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.c66"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.c66"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.c66", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.c66");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.c66.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.c66'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.c66$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.c66$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.c66$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c66.ae66',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c66.ae66e',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c66.ae66', {target: 'ti.targets.elf.C66', suffix: 'e66'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c66.ae66e', {target: 'ti.targets.elf.C66_big_endian', suffix: 'e66e'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c66.Cache", "ti.sysbios.family.c66");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c66.Cache.Module", "ti.sysbios.family.c66");
        vo.init2(po, "ti.sysbios.family.c66.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c66.Cache$$capsule", "ti.sysbios.family.c66"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c66", "ti.sysbios.family.c66"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.c66"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.c66.Cache.ModuleView", "ti.sysbios.family.c66"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.Cache.ModuleView", "ti.sysbios.family.c66"));
        vo.bind("MarRegisterView", om.findStrict("ti.sysbios.family.c66.Cache.MarRegisterView", "ti.sysbios.family.c66"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.Cache.MarRegisterView", "ti.sysbios.family.c66"));
        vo.bind("Mode", om.findStrict("ti.sysbios.family.c66.Cache.Mode", "ti.sysbios.family.c66"));
        vo.bind("L1Size", om.findStrict("ti.sysbios.family.c66.Cache.L1Size", "ti.sysbios.family.c66"));
        vo.bind("L2Size", om.findStrict("ti.sysbios.family.c66.Cache.L2Size", "ti.sysbios.family.c66"));
        vo.bind("Mar", om.findStrict("ti.sysbios.family.c66.Cache.Mar", "ti.sysbios.family.c66"));
        vo.bind("Size", om.findStrict("ti.sysbios.family.c66.Cache.Size", "ti.sysbios.family.c66"));
        tdefs.add(om.findStrict("ti.sysbios.family.c66.Cache.Size", "ti.sysbios.family.c66"));
        mcfgs.add("initSize");
        mcfgs.add("E_invalidL1CacheSize");
        mcfgs.add("E_invalidL2CacheSize");
        mcfgs.add("atomicBlockSize");
        mcfgs.add("registerRTSSynch");
        mcfgs.add("marvalues");
        icfgs.add("marvalues");
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.family.c66"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.family.c66"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.family.c66"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.family.c66"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.family.c66"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.family.c66"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.family.c66"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.family.c66"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.family.c66"));
        vo.bind("Mode_FREEZE", om.findStrict("ti.sysbios.family.c66.Cache.Mode_FREEZE", "ti.sysbios.family.c66"));
        vo.bind("Mode_BYPASS", om.findStrict("ti.sysbios.family.c66.Cache.Mode_BYPASS", "ti.sysbios.family.c66"));
        vo.bind("Mode_NORMAL", om.findStrict("ti.sysbios.family.c66.Cache.Mode_NORMAL", "ti.sysbios.family.c66"));
        vo.bind("L1Size_0K", om.findStrict("ti.sysbios.family.c66.Cache.L1Size_0K", "ti.sysbios.family.c66"));
        vo.bind("L1Size_4K", om.findStrict("ti.sysbios.family.c66.Cache.L1Size_4K", "ti.sysbios.family.c66"));
        vo.bind("L1Size_8K", om.findStrict("ti.sysbios.family.c66.Cache.L1Size_8K", "ti.sysbios.family.c66"));
        vo.bind("L1Size_16K", om.findStrict("ti.sysbios.family.c66.Cache.L1Size_16K", "ti.sysbios.family.c66"));
        vo.bind("L1Size_32K", om.findStrict("ti.sysbios.family.c66.Cache.L1Size_32K", "ti.sysbios.family.c66"));
        vo.bind("L2Size_0K", om.findStrict("ti.sysbios.family.c66.Cache.L2Size_0K", "ti.sysbios.family.c66"));
        vo.bind("L2Size_32K", om.findStrict("ti.sysbios.family.c66.Cache.L2Size_32K", "ti.sysbios.family.c66"));
        vo.bind("L2Size_64K", om.findStrict("ti.sysbios.family.c66.Cache.L2Size_64K", "ti.sysbios.family.c66"));
        vo.bind("L2Size_128K", om.findStrict("ti.sysbios.family.c66.Cache.L2Size_128K", "ti.sysbios.family.c66"));
        vo.bind("L2Size_256K", om.findStrict("ti.sysbios.family.c66.Cache.L2Size_256K", "ti.sysbios.family.c66"));
        vo.bind("L2Size_512K", om.findStrict("ti.sysbios.family.c66.Cache.L2Size_512K", "ti.sysbios.family.c66"));
        vo.bind("L2Size_1024K", om.findStrict("ti.sysbios.family.c66.Cache.L2Size_1024K", "ti.sysbios.family.c66"));
        vo.bind("Mar_DISABLE", om.findStrict("ti.sysbios.family.c66.Cache.Mar_DISABLE", "ti.sysbios.family.c66"));
        vo.bind("Mar_ENABLE", om.findStrict("ti.sysbios.family.c66.Cache.Mar_ENABLE", "ti.sysbios.family.c66"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c66")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.c66.Cache.enable", "ti.sysbios.family.c66"));
        vo.bind("wait", om.findStrict("ti.sysbios.family.c66.Cache.wait", "ti.sysbios.family.c66"));
        vo.bind("disable", om.findStrict("ti.sysbios.family.c66.Cache.disable", "ti.sysbios.family.c66"));
        vo.bind("getMode", om.findStrict("ti.sysbios.family.c66.Cache.getMode", "ti.sysbios.family.c66"));
        vo.bind("setMode", om.findStrict("ti.sysbios.family.c66.Cache.setMode", "ti.sysbios.family.c66"));
        vo.bind("getSize", om.findStrict("ti.sysbios.family.c66.Cache.getSize", "ti.sysbios.family.c66"));
        vo.bind("setSize", om.findStrict("ti.sysbios.family.c66.Cache.setSize", "ti.sysbios.family.c66"));
        vo.bind("getMar", om.findStrict("ti.sysbios.family.c66.Cache.getMar", "ti.sysbios.family.c66"));
        vo.bind("setMar", om.findStrict("ti.sysbios.family.c66.Cache.setMar", "ti.sysbios.family.c66"));
        vo.bind("inv", om.findStrict("ti.sysbios.family.c66.Cache.inv", "ti.sysbios.family.c66"));
        vo.bind("wb", om.findStrict("ti.sysbios.family.c66.Cache.wb", "ti.sysbios.family.c66"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.family.c66.Cache.wbInv", "ti.sysbios.family.c66"));
        vo.bind("invL1pAll", om.findStrict("ti.sysbios.family.c66.Cache.invL1pAll", "ti.sysbios.family.c66"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.family.c66.Cache.wbAll", "ti.sysbios.family.c66"));
        vo.bind("wbL1dAll", om.findStrict("ti.sysbios.family.c66.Cache.wbL1dAll", "ti.sysbios.family.c66"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.family.c66.Cache.wbInvAll", "ti.sysbios.family.c66"));
        vo.bind("wbInvL1dAll", om.findStrict("ti.sysbios.family.c66.Cache.wbInvL1dAll", "ti.sysbios.family.c66"));
        vo.bind("RTSSynchInv", om.findStrict("ti.sysbios.family.c66.Cache.RTSSynchInv", "ti.sysbios.family.c66"));
        vo.bind("RTSSynchWb", om.findStrict("ti.sysbios.family.c66.Cache.RTSSynchWb", "ti.sysbios.family.c66"));
        vo.bind("RTSSynchWbInv", om.findStrict("ti.sysbios.family.c66.Cache.RTSSynchWbInv", "ti.sysbios.family.c66"));
        vo.bind("invPrefetchBuffer", om.findStrict("ti.sysbios.family.c66.Cache.invPrefetchBuffer", "ti.sysbios.family.c66"));
        vo.bind("all", om.findStrict("ti.sysbios.family.c66.Cache.all", "ti.sysbios.family.c66"));
        vo.bind("block", om.findStrict("ti.sysbios.family.c66.Cache.block", "ti.sysbios.family.c66"));
        vo.bind("getL1DInitSize", om.findStrict("ti.sysbios.family.c66.Cache.getL1DInitSize", "ti.sysbios.family.c66"));
        vo.bind("getL1PInitSize", om.findStrict("ti.sysbios.family.c66.Cache.getL1PInitSize", "ti.sysbios.family.c66"));
        vo.bind("getL2InitSize", om.findStrict("ti.sysbios.family.c66.Cache.getL2InitSize", "ti.sysbios.family.c66"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.c66.Cache.startup", "ti.sysbios.family.c66"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c66_Cache_Module__startupDone__E", "ti_sysbios_family_c66_Cache_enable__E", "ti_sysbios_family_c66_Cache_wait__E", "ti_sysbios_family_c66_Cache_disable__E", "ti_sysbios_family_c66_Cache_getMode__E", "ti_sysbios_family_c66_Cache_setMode__E", "ti_sysbios_family_c66_Cache_getSize__E", "ti_sysbios_family_c66_Cache_setSize__E", "ti_sysbios_family_c66_Cache_getMar__E", "ti_sysbios_family_c66_Cache_setMar__E", "ti_sysbios_family_c66_Cache_inv__E", "ti_sysbios_family_c66_Cache_wb__E", "ti_sysbios_family_c66_Cache_wbInv__E", "ti_sysbios_family_c66_Cache_invL1pAll__E", "ti_sysbios_family_c66_Cache_wbAll__E", "ti_sysbios_family_c66_Cache_wbL1dAll__E", "ti_sysbios_family_c66_Cache_wbInvAll__E", "ti_sysbios_family_c66_Cache_wbInvL1dAll__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_invalidL1CacheSize", "E_invalidL2CacheSize"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Cache", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cache");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c66.Cache", "ti.sysbios.family.c66"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c66.Cache", "ti.sysbios.family.c66");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")}), Global.newArray(new Object[]{"MARs", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitMarRegisters", "structName", "MarRegisterView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.c66.Cache")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.c66")).add(pkgV);
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
        Cache$$CONSTS();
        Cache$$CREATES();
        Cache$$FUNCTIONS();
        Cache$$SIZES();
        Cache$$TYPES();
        if (isROV) {
            Cache$$ROV();
        }//isROV
        $$SINGLETONS();
        Cache$$SINGLETONS();
        $$INITIALIZATION();
    }
}
